# Explore: explore_0450
# Auto-generated LookML Explore File

include: "/views/domain_01/view_01351.view.lkml"
include: "/views/domain_03/view_01353.view.lkml"
include: "/views/domain_04/view_01354.view.lkml"
include: "/views/domain_05/view_01355.view.lkml"

explore: explore_0450 {
  label: "Explore Explore 0450"
  description: "Comprehensive analytics explore joining base view_01351 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01351
  
  always_filter: {
    filters: [view_01351.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01351.created_at_date: "7 days"]
    unless: [view_01351.id, view_01351.status]
  }

  join: view_01353 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01351.user_id} = ${view_01353.id} ;;
    required_joins: []
  }

  join: view_01354 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01351.account_id} = ${view_01354.account_id} ;;
    required_joins: [view_01353]
  }

  join: view_01355 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01351.category} = ${view_01355.category} ;;
  }

  access_filter: {
    field: view_01351.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01351.is_deleted} = false ;;
}
