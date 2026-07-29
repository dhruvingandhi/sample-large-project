# Explore: explore_2447
# Auto-generated LookML Explore File

include: "/views/domain_42/view_07342.view.lkml"
include: "/views/domain_44/view_07344.view.lkml"
include: "/views/domain_45/view_07345.view.lkml"
include: "/views/domain_46/view_07346.view.lkml"

explore: explore_2447 {
  label: "Explore Explore 2447"
  description: "Comprehensive analytics explore joining base view_07342 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07342
  
  always_filter: {
    filters: [view_07342.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07342.created_at_date: "7 days"]
    unless: [view_07342.id, view_07342.status]
  }

  join: view_07344 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07342.user_id} = ${view_07344.id} ;;
    required_joins: []
  }

  join: view_07345 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07342.account_id} = ${view_07345.account_id} ;;
    required_joins: [view_07344]
  }

  join: view_07346 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07342.category} = ${view_07346.category} ;;
  }

  access_filter: {
    field: view_07342.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07342.is_deleted} = false ;;
}
