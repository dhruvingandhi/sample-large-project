# Explore: explore_1551
# Auto-generated LookML Explore File

include: "/views/domain_04/view_04654.view.lkml"
include: "/views/domain_06/view_04656.view.lkml"
include: "/views/domain_07/view_04657.view.lkml"
include: "/views/domain_08/view_04658.view.lkml"

explore: explore_1551 {
  label: "Explore Explore 1551"
  description: "Comprehensive analytics explore joining base view_04654 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04654
  
  always_filter: {
    filters: [view_04654.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04654.created_at_date: "7 days"]
    unless: [view_04654.id, view_04654.status]
  }

  join: view_04656 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04654.user_id} = ${view_04656.id} ;;
    required_joins: []
  }

  join: view_04657 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04654.account_id} = ${view_04657.account_id} ;;
    required_joins: [view_04656]
  }

  join: view_04658 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04654.category} = ${view_04658.category} ;;
  }

  access_filter: {
    field: view_04654.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04654.is_deleted} = false ;;
}
