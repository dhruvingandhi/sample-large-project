# Explore: explore_0487
# Auto-generated LookML Explore File

include: "/views/domain_12/view_01462.view.lkml"
include: "/views/domain_14/view_01464.view.lkml"
include: "/views/domain_15/view_01465.view.lkml"
include: "/views/domain_16/view_01466.view.lkml"

explore: explore_0487 {
  label: "Explore Explore 0487"
  description: "Comprehensive analytics explore joining base view_01462 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01462
  
  always_filter: {
    filters: [view_01462.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01462.created_at_date: "7 days"]
    unless: [view_01462.id, view_01462.status]
  }

  join: view_01464 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01462.user_id} = ${view_01464.id} ;;
    required_joins: []
  }

  join: view_01465 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01462.account_id} = ${view_01465.account_id} ;;
    required_joins: [view_01464]
  }

  join: view_01466 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01462.category} = ${view_01466.category} ;;
  }

  access_filter: {
    field: view_01462.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01462.is_deleted} = false ;;
}
