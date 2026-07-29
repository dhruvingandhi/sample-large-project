# Explore: explore_1948
# Auto-generated LookML Explore File

include: "/views/domain_45/view_05845.view.lkml"
include: "/views/domain_47/view_05847.view.lkml"
include: "/views/domain_48/view_05848.view.lkml"
include: "/views/domain_49/view_05849.view.lkml"

explore: explore_1948 {
  label: "Explore Explore 1948"
  description: "Comprehensive analytics explore joining base view_05845 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05845
  
  always_filter: {
    filters: [view_05845.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05845.created_at_date: "7 days"]
    unless: [view_05845.id, view_05845.status]
  }

  join: view_05847 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05845.user_id} = ${view_05847.id} ;;
    required_joins: []
  }

  join: view_05848 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05845.account_id} = ${view_05848.account_id} ;;
    required_joins: [view_05847]
  }

  join: view_05849 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05845.category} = ${view_05849.category} ;;
  }

  access_filter: {
    field: view_05845.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05845.is_deleted} = false ;;
}
