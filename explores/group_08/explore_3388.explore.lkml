# Explore: explore_3388
# Auto-generated LookML Explore File

include: "/views/domain_15/view_10165.view.lkml"
include: "/views/domain_17/view_10167.view.lkml"
include: "/views/domain_18/view_10168.view.lkml"
include: "/views/domain_19/view_10169.view.lkml"

explore: explore_3388 {
  label: "Explore Explore 3388"
  description: "Comprehensive analytics explore joining base view_10165 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10165
  
  always_filter: {
    filters: [view_10165.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10165.created_at_date: "7 days"]
    unless: [view_10165.id, view_10165.status]
  }

  join: view_10167 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10165.user_id} = ${view_10167.id} ;;
    required_joins: []
  }

  join: view_10168 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10165.account_id} = ${view_10168.account_id} ;;
    required_joins: [view_10167]
  }

  join: view_10169 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10165.category} = ${view_10169.category} ;;
  }

  access_filter: {
    field: view_10165.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10165.is_deleted} = false ;;
}
