# Explore: explore_0346
# Auto-generated LookML Explore File

include: "/views/domain_39/view_01039.view.lkml"
include: "/views/domain_41/view_01041.view.lkml"
include: "/views/domain_42/view_01042.view.lkml"
include: "/views/domain_43/view_01043.view.lkml"

explore: explore_0346 {
  label: "Explore Explore 0346"
  description: "Comprehensive analytics explore joining base view_01039 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01039
  
  always_filter: {
    filters: [view_01039.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01039.created_at_date: "7 days"]
    unless: [view_01039.id, view_01039.status]
  }

  join: view_01041 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01039.user_id} = ${view_01041.id} ;;
    required_joins: []
  }

  join: view_01042 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01039.account_id} = ${view_01042.account_id} ;;
    required_joins: [view_01041]
  }

  join: view_01043 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01039.category} = ${view_01043.category} ;;
  }

  access_filter: {
    field: view_01039.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01039.is_deleted} = false ;;
}
