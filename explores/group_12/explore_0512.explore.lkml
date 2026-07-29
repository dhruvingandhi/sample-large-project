# Explore: explore_0512
# Auto-generated LookML Explore File

include: "/views/domain_37/view_01537.view.lkml"
include: "/views/domain_39/view_01539.view.lkml"
include: "/views/domain_40/view_01540.view.lkml"
include: "/views/domain_41/view_01541.view.lkml"

explore: explore_0512 {
  label: "Explore Explore 0512"
  description: "Comprehensive analytics explore joining base view_01537 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01537
  
  always_filter: {
    filters: [view_01537.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01537.created_at_date: "7 days"]
    unless: [view_01537.id, view_01537.status]
  }

  join: view_01539 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01537.user_id} = ${view_01539.id} ;;
    required_joins: []
  }

  join: view_01540 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01537.account_id} = ${view_01540.account_id} ;;
    required_joins: [view_01539]
  }

  join: view_01541 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01537.category} = ${view_01541.category} ;;
  }

  access_filter: {
    field: view_01537.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01537.is_deleted} = false ;;
}
