# Explore: explore_2991
# Auto-generated LookML Explore File

include: "/views/domain_24/view_08974.view.lkml"
include: "/views/domain_26/view_08976.view.lkml"
include: "/views/domain_27/view_08977.view.lkml"
include: "/views/domain_28/view_08978.view.lkml"

explore: explore_2991 {
  label: "Explore Explore 2991"
  description: "Comprehensive analytics explore joining base view_08974 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08974
  
  always_filter: {
    filters: [view_08974.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08974.created_at_date: "7 days"]
    unless: [view_08974.id, view_08974.status]
  }

  join: view_08976 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08974.user_id} = ${view_08976.id} ;;
    required_joins: []
  }

  join: view_08977 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08974.account_id} = ${view_08977.account_id} ;;
    required_joins: [view_08976]
  }

  join: view_08978 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08974.category} = ${view_08978.category} ;;
  }

  access_filter: {
    field: view_08974.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08974.is_deleted} = false ;;
}
