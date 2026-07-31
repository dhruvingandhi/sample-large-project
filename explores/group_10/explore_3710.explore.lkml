# Update for 2000 file diff target
# Explore: explore_3710
# Auto-generated LookML Explore File

include: "/views/domain_31/view_11131.view.lkml"
include: "/views/domain_33/view_11133.view.lkml"
include: "/views/domain_34/view_11134.view.lkml"
include: "/views/domain_35/view_11135.view.lkml"

explore: explore_3710 {
  label: "Explore Explore 3710"
  description: "Comprehensive analytics explore joining base view_11131 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11131
  
  always_filter: {
    filters: [view_11131.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11131.created_at_date: "7 days"]
    unless: [view_11131.id, view_11131.status]
  }

  join: view_11133 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11131.user_id} = ${view_11133.id} ;;
    required_joins: []
  }

  join: view_11134 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11131.account_id} = ${view_11134.account_id} ;;
    required_joins: [view_11133]
  }

  join: view_11135 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11131.category} = ${view_11135.category} ;;
  }

  access_filter: {
    field: view_11131.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11131.is_deleted} = false ;;
}
