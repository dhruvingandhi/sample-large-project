# Explore: explore_3396
# Auto-generated LookML Explore File

include: "/views/domain_39/view_10189.view.lkml"
include: "/views/domain_41/view_10191.view.lkml"
include: "/views/domain_42/view_10192.view.lkml"
include: "/views/domain_43/view_10193.view.lkml"

explore: explore_3396 {
  label: "Explore Explore 3396"
  description: "Comprehensive analytics explore joining base view_10189 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10189
  
  always_filter: {
    filters: [view_10189.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10189.created_at_date: "7 days"]
    unless: [view_10189.id, view_10189.status]
  }

  join: view_10191 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10189.user_id} = ${view_10191.id} ;;
    required_joins: []
  }

  join: view_10192 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10189.account_id} = ${view_10192.account_id} ;;
    required_joins: [view_10191]
  }

  join: view_10193 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10189.category} = ${view_10193.category} ;;
  }

  access_filter: {
    field: view_10189.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10189.is_deleted} = false ;;
}
