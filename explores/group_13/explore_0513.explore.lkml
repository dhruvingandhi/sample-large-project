# Explore: explore_0513
# Auto-generated LookML Explore File

include: "/views/domain_40/view_01540.view.lkml"
include: "/views/domain_42/view_01542.view.lkml"
include: "/views/domain_43/view_01543.view.lkml"
include: "/views/domain_44/view_01544.view.lkml"

explore: explore_0513 {
  label: "Explore Explore 0513"
  description: "Comprehensive analytics explore joining base view_01540 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01540
  
  always_filter: {
    filters: [view_01540.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01540.created_at_date: "7 days"]
    unless: [view_01540.id, view_01540.status]
  }

  join: view_01542 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01540.user_id} = ${view_01542.id} ;;
    required_joins: []
  }

  join: view_01543 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01540.account_id} = ${view_01543.account_id} ;;
    required_joins: [view_01542]
  }

  join: view_01544 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01540.category} = ${view_01544.category} ;;
  }

  access_filter: {
    field: view_01540.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01540.is_deleted} = false ;;
}
