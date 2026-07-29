# Explore: explore_0067
# Auto-generated LookML Explore File

include: "/views/domain_02/view_00202.view.lkml"
include: "/views/domain_04/view_00204.view.lkml"
include: "/views/domain_05/view_00205.view.lkml"
include: "/views/domain_06/view_00206.view.lkml"

explore: explore_0067 {
  label: "Explore Explore 0067"
  description: "Comprehensive analytics explore joining base view_00202 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00202
  
  always_filter: {
    filters: [view_00202.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00202.created_at_date: "7 days"]
    unless: [view_00202.id, view_00202.status]
  }

  join: view_00204 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00202.user_id} = ${view_00204.id} ;;
    required_joins: []
  }

  join: view_00205 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00202.account_id} = ${view_00205.account_id} ;;
    required_joins: [view_00204]
  }

  join: view_00206 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00202.category} = ${view_00206.category} ;;
  }

  access_filter: {
    field: view_00202.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00202.is_deleted} = false ;;
}
