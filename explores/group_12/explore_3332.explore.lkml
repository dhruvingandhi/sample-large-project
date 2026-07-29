# Explore: explore_3332
# Auto-generated LookML Explore File

include: "/views/domain_47/view_09997.view.lkml"
include: "/views/domain_49/view_09999.view.lkml"
include: "/views/domain_50/view_10000.view.lkml"
include: "/views/domain_01/view_10001.view.lkml"

explore: explore_3332 {
  label: "Explore Explore 3332"
  description: "Comprehensive analytics explore joining base view_09997 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09997
  
  always_filter: {
    filters: [view_09997.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09997.created_at_date: "7 days"]
    unless: [view_09997.id, view_09997.status]
  }

  join: view_09999 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09997.user_id} = ${view_09999.id} ;;
    required_joins: []
  }

  join: view_10000 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09997.account_id} = ${view_10000.account_id} ;;
    required_joins: [view_09999]
  }

  join: view_10001 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09997.category} = ${view_10001.category} ;;
  }

  access_filter: {
    field: view_09997.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09997.is_deleted} = false ;;
}
