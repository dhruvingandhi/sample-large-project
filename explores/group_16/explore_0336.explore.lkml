# Explore: explore_0336
# Auto-generated LookML Explore File

include: "/views/domain_09/view_01009.view.lkml"
include: "/views/domain_11/view_01011.view.lkml"
include: "/views/domain_12/view_01012.view.lkml"
include: "/views/domain_13/view_01013.view.lkml"

explore: explore_0336 {
  label: "Explore Explore 0336"
  description: "Comprehensive analytics explore joining base view_01009 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01009
  
  always_filter: {
    filters: [view_01009.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01009.created_at_date: "7 days"]
    unless: [view_01009.id, view_01009.status]
  }

  join: view_01011 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01009.user_id} = ${view_01011.id} ;;
    required_joins: []
  }

  join: view_01012 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01009.account_id} = ${view_01012.account_id} ;;
    required_joins: [view_01011]
  }

  join: view_01013 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01009.category} = ${view_01013.category} ;;
  }

  access_filter: {
    field: view_01009.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01009.is_deleted} = false ;;
}
