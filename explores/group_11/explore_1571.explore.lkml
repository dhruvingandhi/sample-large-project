# Explore: explore_1571
# Auto-generated LookML Explore File

include: "/views/domain_14/view_04714.view.lkml"
include: "/views/domain_16/view_04716.view.lkml"
include: "/views/domain_17/view_04717.view.lkml"
include: "/views/domain_18/view_04718.view.lkml"

explore: explore_1571 {
  label: "Explore Explore 1571"
  description: "Comprehensive analytics explore joining base view_04714 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04714
  
  always_filter: {
    filters: [view_04714.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04714.created_at_date: "7 days"]
    unless: [view_04714.id, view_04714.status]
  }

  join: view_04716 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04714.user_id} = ${view_04716.id} ;;
    required_joins: []
  }

  join: view_04717 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04714.account_id} = ${view_04717.account_id} ;;
    required_joins: [view_04716]
  }

  join: view_04718 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04714.category} = ${view_04718.category} ;;
  }

  access_filter: {
    field: view_04714.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04714.is_deleted} = false ;;
}
