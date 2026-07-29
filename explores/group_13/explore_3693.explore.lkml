# Explore: explore_3693
# Auto-generated LookML Explore File

include: "/views/domain_30/view_11080.view.lkml"
include: "/views/domain_32/view_11082.view.lkml"
include: "/views/domain_33/view_11083.view.lkml"
include: "/views/domain_34/view_11084.view.lkml"

explore: explore_3693 {
  label: "Explore Explore 3693"
  description: "Comprehensive analytics explore joining base view_11080 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11080
  
  always_filter: {
    filters: [view_11080.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11080.created_at_date: "7 days"]
    unless: [view_11080.id, view_11080.status]
  }

  join: view_11082 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11080.user_id} = ${view_11082.id} ;;
    required_joins: []
  }

  join: view_11083 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11080.account_id} = ${view_11083.account_id} ;;
    required_joins: [view_11082]
  }

  join: view_11084 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11080.category} = ${view_11084.category} ;;
  }

  access_filter: {
    field: view_11080.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11080.is_deleted} = false ;;
}
