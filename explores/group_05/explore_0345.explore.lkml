# Explore: explore_0345
# Auto-generated LookML Explore File

include: "/views/domain_36/view_01036.view.lkml"
include: "/views/domain_38/view_01038.view.lkml"
include: "/views/domain_39/view_01039.view.lkml"
include: "/views/domain_40/view_01040.view.lkml"

explore: explore_0345 {
  label: "Explore Explore 0345"
  description: "Comprehensive analytics explore joining base view_01036 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01036
  
  always_filter: {
    filters: [view_01036.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01036.created_at_date: "7 days"]
    unless: [view_01036.id, view_01036.status]
  }

  join: view_01038 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01036.user_id} = ${view_01038.id} ;;
    required_joins: []
  }

  join: view_01039 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01036.account_id} = ${view_01039.account_id} ;;
    required_joins: [view_01038]
  }

  join: view_01040 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01036.category} = ${view_01040.category} ;;
  }

  access_filter: {
    field: view_01036.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01036.is_deleted} = false ;;
}
