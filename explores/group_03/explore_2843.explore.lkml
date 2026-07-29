# Explore: explore_2843
# Auto-generated LookML Explore File

include: "/views/domain_30/view_08530.view.lkml"
include: "/views/domain_32/view_08532.view.lkml"
include: "/views/domain_33/view_08533.view.lkml"
include: "/views/domain_34/view_08534.view.lkml"

explore: explore_2843 {
  label: "Explore Explore 2843"
  description: "Comprehensive analytics explore joining base view_08530 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08530
  
  always_filter: {
    filters: [view_08530.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08530.created_at_date: "7 days"]
    unless: [view_08530.id, view_08530.status]
  }

  join: view_08532 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08530.user_id} = ${view_08532.id} ;;
    required_joins: []
  }

  join: view_08533 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08530.account_id} = ${view_08533.account_id} ;;
    required_joins: [view_08532]
  }

  join: view_08534 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08530.category} = ${view_08534.category} ;;
  }

  access_filter: {
    field: view_08530.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08530.is_deleted} = false ;;
}
