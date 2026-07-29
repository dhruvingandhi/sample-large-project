# Explore: explore_1447
# Auto-generated LookML Explore File

include: "/views/domain_42/view_04342.view.lkml"
include: "/views/domain_44/view_04344.view.lkml"
include: "/views/domain_45/view_04345.view.lkml"
include: "/views/domain_46/view_04346.view.lkml"

explore: explore_1447 {
  label: "Explore Explore 1447"
  description: "Comprehensive analytics explore joining base view_04342 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04342
  
  always_filter: {
    filters: [view_04342.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04342.created_at_date: "7 days"]
    unless: [view_04342.id, view_04342.status]
  }

  join: view_04344 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04342.user_id} = ${view_04344.id} ;;
    required_joins: []
  }

  join: view_04345 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04342.account_id} = ${view_04345.account_id} ;;
    required_joins: [view_04344]
  }

  join: view_04346 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04342.category} = ${view_04346.category} ;;
  }

  access_filter: {
    field: view_04342.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04342.is_deleted} = false ;;
}
