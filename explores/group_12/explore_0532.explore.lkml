# Explore: explore_0532
# Auto-generated LookML Explore File

include: "/views/domain_47/view_01597.view.lkml"
include: "/views/domain_49/view_01599.view.lkml"
include: "/views/domain_50/view_01600.view.lkml"
include: "/views/domain_01/view_01601.view.lkml"

explore: explore_0532 {
  label: "Explore Explore 0532"
  description: "Comprehensive analytics explore joining base view_01597 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01597
  
  always_filter: {
    filters: [view_01597.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01597.created_at_date: "7 days"]
    unless: [view_01597.id, view_01597.status]
  }

  join: view_01599 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01597.user_id} = ${view_01599.id} ;;
    required_joins: []
  }

  join: view_01600 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01597.account_id} = ${view_01600.account_id} ;;
    required_joins: [view_01599]
  }

  join: view_01601 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01597.category} = ${view_01601.category} ;;
  }

  access_filter: {
    field: view_01597.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01597.is_deleted} = false ;;
}
