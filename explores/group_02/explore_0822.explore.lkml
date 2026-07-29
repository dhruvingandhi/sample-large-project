# Explore: explore_0822
# Auto-generated LookML Explore File

include: "/views/domain_17/view_02467.view.lkml"
include: "/views/domain_19/view_02469.view.lkml"
include: "/views/domain_20/view_02470.view.lkml"
include: "/views/domain_21/view_02471.view.lkml"

explore: explore_0822 {
  label: "Explore Explore 0822"
  description: "Comprehensive analytics explore joining base view_02467 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02467
  
  always_filter: {
    filters: [view_02467.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02467.created_at_date: "7 days"]
    unless: [view_02467.id, view_02467.status]
  }

  join: view_02469 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02467.user_id} = ${view_02469.id} ;;
    required_joins: []
  }

  join: view_02470 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02467.account_id} = ${view_02470.account_id} ;;
    required_joins: [view_02469]
  }

  join: view_02471 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02467.category} = ${view_02471.category} ;;
  }

  access_filter: {
    field: view_02467.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02467.is_deleted} = false ;;
}
