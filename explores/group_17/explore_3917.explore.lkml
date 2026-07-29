# Explore: explore_3917
# Auto-generated LookML Explore File

include: "/views/domain_02/view_11752.view.lkml"
include: "/views/domain_04/view_11754.view.lkml"
include: "/views/domain_05/view_11755.view.lkml"
include: "/views/domain_06/view_11756.view.lkml"

explore: explore_3917 {
  label: "Explore Explore 3917"
  description: "Comprehensive analytics explore joining base view_11752 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11752
  
  always_filter: {
    filters: [view_11752.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11752.created_at_date: "7 days"]
    unless: [view_11752.id, view_11752.status]
  }

  join: view_11754 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11752.user_id} = ${view_11754.id} ;;
    required_joins: []
  }

  join: view_11755 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11752.account_id} = ${view_11755.account_id} ;;
    required_joins: [view_11754]
  }

  join: view_11756 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11752.category} = ${view_11756.category} ;;
  }

  access_filter: {
    field: view_11752.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11752.is_deleted} = false ;;
}
