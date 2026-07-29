# Explore: explore_3414
# Auto-generated LookML Explore File

include: "/views/domain_43/view_10243.view.lkml"
include: "/views/domain_45/view_10245.view.lkml"
include: "/views/domain_46/view_10246.view.lkml"
include: "/views/domain_47/view_10247.view.lkml"

explore: explore_3414 {
  label: "Explore Explore 3414"
  description: "Comprehensive analytics explore joining base view_10243 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10243
  
  always_filter: {
    filters: [view_10243.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10243.created_at_date: "7 days"]
    unless: [view_10243.id, view_10243.status]
  }

  join: view_10245 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10243.user_id} = ${view_10245.id} ;;
    required_joins: []
  }

  join: view_10246 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10243.account_id} = ${view_10246.account_id} ;;
    required_joins: [view_10245]
  }

  join: view_10247 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10243.category} = ${view_10247.category} ;;
  }

  access_filter: {
    field: view_10243.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10243.is_deleted} = false ;;
}
