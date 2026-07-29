# Explore: explore_0842
# Auto-generated LookML Explore File

include: "/views/domain_27/view_02527.view.lkml"
include: "/views/domain_29/view_02529.view.lkml"
include: "/views/domain_30/view_02530.view.lkml"
include: "/views/domain_31/view_02531.view.lkml"

explore: explore_0842 {
  label: "Explore Explore 0842"
  description: "Comprehensive analytics explore joining base view_02527 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02527
  
  always_filter: {
    filters: [view_02527.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02527.created_at_date: "7 days"]
    unless: [view_02527.id, view_02527.status]
  }

  join: view_02529 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02527.user_id} = ${view_02529.id} ;;
    required_joins: []
  }

  join: view_02530 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02527.account_id} = ${view_02530.account_id} ;;
    required_joins: [view_02529]
  }

  join: view_02531 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02527.category} = ${view_02531.category} ;;
  }

  access_filter: {
    field: view_02527.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02527.is_deleted} = false ;;
}
