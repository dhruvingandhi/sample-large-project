# Explore: explore_0632
# Auto-generated LookML Explore File

include: "/views/domain_47/view_01897.view.lkml"
include: "/views/domain_49/view_01899.view.lkml"
include: "/views/domain_50/view_01900.view.lkml"
include: "/views/domain_01/view_01901.view.lkml"

explore: explore_0632 {
  label: "Explore Explore 0632"
  description: "Comprehensive analytics explore joining base view_01897 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01897
  
  always_filter: {
    filters: [view_01897.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01897.created_at_date: "7 days"]
    unless: [view_01897.id, view_01897.status]
  }

  join: view_01899 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01897.user_id} = ${view_01899.id} ;;
    required_joins: []
  }

  join: view_01900 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01897.account_id} = ${view_01900.account_id} ;;
    required_joins: [view_01899]
  }

  join: view_01901 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01897.category} = ${view_01901.category} ;;
  }

  access_filter: {
    field: view_01897.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01897.is_deleted} = false ;;
}
