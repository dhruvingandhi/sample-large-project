# Explore: explore_1437
# Auto-generated LookML Explore File

include: "/views/domain_12/view_04312.view.lkml"
include: "/views/domain_14/view_04314.view.lkml"
include: "/views/domain_15/view_04315.view.lkml"
include: "/views/domain_16/view_04316.view.lkml"

explore: explore_1437 {
  label: "Explore Explore 1437"
  description: "Comprehensive analytics explore joining base view_04312 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04312
  
  always_filter: {
    filters: [view_04312.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04312.created_at_date: "7 days"]
    unless: [view_04312.id, view_04312.status]
  }

  join: view_04314 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04312.user_id} = ${view_04314.id} ;;
    required_joins: []
  }

  join: view_04315 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04312.account_id} = ${view_04315.account_id} ;;
    required_joins: [view_04314]
  }

  join: view_04316 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04312.category} = ${view_04316.category} ;;
  }

  access_filter: {
    field: view_04312.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04312.is_deleted} = false ;;
}
