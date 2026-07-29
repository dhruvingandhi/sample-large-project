# Explore: explore_2661
# Auto-generated LookML Explore File

include: "/views/domain_34/view_07984.view.lkml"
include: "/views/domain_36/view_07986.view.lkml"
include: "/views/domain_37/view_07987.view.lkml"
include: "/views/domain_38/view_07988.view.lkml"

explore: explore_2661 {
  label: "Explore Explore 2661"
  description: "Comprehensive analytics explore joining base view_07984 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07984
  
  always_filter: {
    filters: [view_07984.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07984.created_at_date: "7 days"]
    unless: [view_07984.id, view_07984.status]
  }

  join: view_07986 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07984.user_id} = ${view_07986.id} ;;
    required_joins: []
  }

  join: view_07987 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07984.account_id} = ${view_07987.account_id} ;;
    required_joins: [view_07986]
  }

  join: view_07988 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07984.category} = ${view_07988.category} ;;
  }

  access_filter: {
    field: view_07984.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07984.is_deleted} = false ;;
}
