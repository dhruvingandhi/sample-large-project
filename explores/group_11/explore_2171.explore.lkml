# Explore: explore_2171
# Auto-generated LookML Explore File

include: "/views/domain_14/view_06514.view.lkml"
include: "/views/domain_16/view_06516.view.lkml"
include: "/views/domain_17/view_06517.view.lkml"
include: "/views/domain_18/view_06518.view.lkml"

explore: explore_2171 {
  label: "Explore Explore 2171"
  description: "Comprehensive analytics explore joining base view_06514 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06514
  
  always_filter: {
    filters: [view_06514.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06514.created_at_date: "7 days"]
    unless: [view_06514.id, view_06514.status]
  }

  join: view_06516 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06514.user_id} = ${view_06516.id} ;;
    required_joins: []
  }

  join: view_06517 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06514.account_id} = ${view_06517.account_id} ;;
    required_joins: [view_06516]
  }

  join: view_06518 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06514.category} = ${view_06518.category} ;;
  }

  access_filter: {
    field: view_06514.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06514.is_deleted} = false ;;
}
