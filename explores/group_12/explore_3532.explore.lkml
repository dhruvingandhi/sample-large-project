# Explore: explore_3532
# Auto-generated LookML Explore File

include: "/views/domain_47/view_10597.view.lkml"
include: "/views/domain_49/view_10599.view.lkml"
include: "/views/domain_50/view_10600.view.lkml"
include: "/views/domain_01/view_10601.view.lkml"

explore: explore_3532 {
  label: "Explore Explore 3532"
  description: "Comprehensive analytics explore joining base view_10597 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10597
  
  always_filter: {
    filters: [view_10597.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10597.created_at_date: "7 days"]
    unless: [view_10597.id, view_10597.status]
  }

  join: view_10599 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10597.user_id} = ${view_10599.id} ;;
    required_joins: []
  }

  join: view_10600 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10597.account_id} = ${view_10600.account_id} ;;
    required_joins: [view_10599]
  }

  join: view_10601 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10597.category} = ${view_10601.category} ;;
  }

  access_filter: {
    field: view_10597.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10597.is_deleted} = false ;;
}
