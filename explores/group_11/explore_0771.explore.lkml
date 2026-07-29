# Explore: explore_0771
# Auto-generated LookML Explore File

include: "/views/domain_14/view_02314.view.lkml"
include: "/views/domain_16/view_02316.view.lkml"
include: "/views/domain_17/view_02317.view.lkml"
include: "/views/domain_18/view_02318.view.lkml"

explore: explore_0771 {
  label: "Explore Explore 0771"
  description: "Comprehensive analytics explore joining base view_02314 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02314
  
  always_filter: {
    filters: [view_02314.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02314.created_at_date: "7 days"]
    unless: [view_02314.id, view_02314.status]
  }

  join: view_02316 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02314.user_id} = ${view_02316.id} ;;
    required_joins: []
  }

  join: view_02317 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02314.account_id} = ${view_02317.account_id} ;;
    required_joins: [view_02316]
  }

  join: view_02318 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02314.category} = ${view_02318.category} ;;
  }

  access_filter: {
    field: view_02314.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02314.is_deleted} = false ;;
}
