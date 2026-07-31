# Update for 2000 file diff target
# Explore: explore_1110
# Auto-generated LookML Explore File

include: "/views/domain_31/view_03331.view.lkml"
include: "/views/domain_33/view_03333.view.lkml"
include: "/views/domain_34/view_03334.view.lkml"
include: "/views/domain_35/view_03335.view.lkml"

explore: explore_1110 {
  label: "Explore Explore 1110"
  description: "Comprehensive analytics explore joining base view_03331 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03331
  
  always_filter: {
    filters: [view_03331.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03331.created_at_date: "7 days"]
    unless: [view_03331.id, view_03331.status]
  }

  join: view_03333 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03331.user_id} = ${view_03333.id} ;;
    required_joins: []
  }

  join: view_03334 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03331.account_id} = ${view_03334.account_id} ;;
    required_joins: [view_03333]
  }

  join: view_03335 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03331.category} = ${view_03335.category} ;;
  }

  access_filter: {
    field: view_03331.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03331.is_deleted} = false ;;
}
