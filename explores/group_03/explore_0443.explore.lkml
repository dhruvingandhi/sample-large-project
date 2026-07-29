# Explore: explore_0443
# Auto-generated LookML Explore File

include: "/views/domain_30/view_01330.view.lkml"
include: "/views/domain_32/view_01332.view.lkml"
include: "/views/domain_33/view_01333.view.lkml"
include: "/views/domain_34/view_01334.view.lkml"

explore: explore_0443 {
  label: "Explore Explore 0443"
  description: "Comprehensive analytics explore joining base view_01330 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01330
  
  always_filter: {
    filters: [view_01330.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01330.created_at_date: "7 days"]
    unless: [view_01330.id, view_01330.status]
  }

  join: view_01332 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01330.user_id} = ${view_01332.id} ;;
    required_joins: []
  }

  join: view_01333 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01330.account_id} = ${view_01333.account_id} ;;
    required_joins: [view_01332]
  }

  join: view_01334 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01330.category} = ${view_01334.category} ;;
  }

  access_filter: {
    field: view_01330.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01330.is_deleted} = false ;;
}
