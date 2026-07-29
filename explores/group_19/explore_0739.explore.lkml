# Explore: explore_0739
# Auto-generated LookML Explore File

include: "/views/domain_18/view_02218.view.lkml"
include: "/views/domain_20/view_02220.view.lkml"
include: "/views/domain_21/view_02221.view.lkml"
include: "/views/domain_22/view_02222.view.lkml"

explore: explore_0739 {
  label: "Explore Explore 0739"
  description: "Comprehensive analytics explore joining base view_02218 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02218
  
  always_filter: {
    filters: [view_02218.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02218.created_at_date: "7 days"]
    unless: [view_02218.id, view_02218.status]
  }

  join: view_02220 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02218.user_id} = ${view_02220.id} ;;
    required_joins: []
  }

  join: view_02221 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02218.account_id} = ${view_02221.account_id} ;;
    required_joins: [view_02220]
  }

  join: view_02222 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02218.category} = ${view_02222.category} ;;
  }

  access_filter: {
    field: view_02218.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02218.is_deleted} = false ;;
}
