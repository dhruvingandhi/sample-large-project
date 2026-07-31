# Update for 2000 file diff target
# Explore: explore_3010
# Auto-generated LookML Explore File

include: "/views/domain_31/view_09031.view.lkml"
include: "/views/domain_33/view_09033.view.lkml"
include: "/views/domain_34/view_09034.view.lkml"
include: "/views/domain_35/view_09035.view.lkml"

explore: explore_3010 {
  label: "Explore Explore 3010"
  description: "Comprehensive analytics explore joining base view_09031 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09031
  
  always_filter: {
    filters: [view_09031.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09031.created_at_date: "7 days"]
    unless: [view_09031.id, view_09031.status]
  }

  join: view_09033 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09031.user_id} = ${view_09033.id} ;;
    required_joins: []
  }

  join: view_09034 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09031.account_id} = ${view_09034.account_id} ;;
    required_joins: [view_09033]
  }

  join: view_09035 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09031.category} = ${view_09035.category} ;;
  }

  access_filter: {
    field: view_09031.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09031.is_deleted} = false ;;
}
