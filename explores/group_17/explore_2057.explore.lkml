# Explore: explore_2057
# Auto-generated LookML Explore File

include: "/views/domain_22/view_06172.view.lkml"
include: "/views/domain_24/view_06174.view.lkml"
include: "/views/domain_25/view_06175.view.lkml"
include: "/views/domain_26/view_06176.view.lkml"

explore: explore_2057 {
  label: "Explore Explore 2057"
  description: "Comprehensive analytics explore joining base view_06172 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06172
  
  always_filter: {
    filters: [view_06172.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06172.created_at_date: "7 days"]
    unless: [view_06172.id, view_06172.status]
  }

  join: view_06174 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06172.user_id} = ${view_06174.id} ;;
    required_joins: []
  }

  join: view_06175 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06172.account_id} = ${view_06175.account_id} ;;
    required_joins: [view_06174]
  }

  join: view_06176 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06172.category} = ${view_06176.category} ;;
  }

  access_filter: {
    field: view_06172.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06172.is_deleted} = false ;;
}
