# Explore: explore_0843
# Auto-generated LookML Explore File

include: "/views/domain_30/view_02530.view.lkml"
include: "/views/domain_32/view_02532.view.lkml"
include: "/views/domain_33/view_02533.view.lkml"
include: "/views/domain_34/view_02534.view.lkml"

explore: explore_0843 {
  label: "Explore Explore 0843"
  description: "Comprehensive analytics explore joining base view_02530 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02530
  
  always_filter: {
    filters: [view_02530.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02530.created_at_date: "7 days"]
    unless: [view_02530.id, view_02530.status]
  }

  join: view_02532 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02530.user_id} = ${view_02532.id} ;;
    required_joins: []
  }

  join: view_02533 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02530.account_id} = ${view_02533.account_id} ;;
    required_joins: [view_02532]
  }

  join: view_02534 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02530.category} = ${view_02534.category} ;;
  }

  access_filter: {
    field: view_02530.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02530.is_deleted} = false ;;
}
