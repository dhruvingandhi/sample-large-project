# Explore: explore_2056
# Auto-generated LookML Explore File

include: "/views/domain_19/view_06169.view.lkml"
include: "/views/domain_21/view_06171.view.lkml"
include: "/views/domain_22/view_06172.view.lkml"
include: "/views/domain_23/view_06173.view.lkml"

explore: explore_2056 {
  label: "Explore Explore 2056"
  description: "Comprehensive analytics explore joining base view_06169 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06169
  
  always_filter: {
    filters: [view_06169.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06169.created_at_date: "7 days"]
    unless: [view_06169.id, view_06169.status]
  }

  join: view_06171 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06169.user_id} = ${view_06171.id} ;;
    required_joins: []
  }

  join: view_06172 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06169.account_id} = ${view_06172.account_id} ;;
    required_joins: [view_06171]
  }

  join: view_06173 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06169.category} = ${view_06173.category} ;;
  }

  access_filter: {
    field: view_06169.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06169.is_deleted} = false ;;
}
