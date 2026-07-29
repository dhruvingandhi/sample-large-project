# Explore: explore_3688
# Auto-generated LookML Explore File

include: "/views/domain_15/view_11065.view.lkml"
include: "/views/domain_17/view_11067.view.lkml"
include: "/views/domain_18/view_11068.view.lkml"
include: "/views/domain_19/view_11069.view.lkml"

explore: explore_3688 {
  label: "Explore Explore 3688"
  description: "Comprehensive analytics explore joining base view_11065 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11065
  
  always_filter: {
    filters: [view_11065.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11065.created_at_date: "7 days"]
    unless: [view_11065.id, view_11065.status]
  }

  join: view_11067 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11065.user_id} = ${view_11067.id} ;;
    required_joins: []
  }

  join: view_11068 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11065.account_id} = ${view_11068.account_id} ;;
    required_joins: [view_11067]
  }

  join: view_11069 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11065.category} = ${view_11069.category} ;;
  }

  access_filter: {
    field: view_11065.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11065.is_deleted} = false ;;
}
