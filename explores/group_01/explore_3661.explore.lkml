# Explore: explore_3661
# Auto-generated LookML Explore File

include: "/views/domain_34/view_10984.view.lkml"
include: "/views/domain_36/view_10986.view.lkml"
include: "/views/domain_37/view_10987.view.lkml"
include: "/views/domain_38/view_10988.view.lkml"

explore: explore_3661 {
  label: "Explore Explore 3661"
  description: "Comprehensive analytics explore joining base view_10984 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10984
  
  always_filter: {
    filters: [view_10984.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10984.created_at_date: "7 days"]
    unless: [view_10984.id, view_10984.status]
  }

  join: view_10986 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10984.user_id} = ${view_10986.id} ;;
    required_joins: []
  }

  join: view_10987 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10984.account_id} = ${view_10987.account_id} ;;
    required_joins: [view_10986]
  }

  join: view_10988 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10984.category} = ${view_10988.category} ;;
  }

  access_filter: {
    field: view_10984.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10984.is_deleted} = false ;;
}
