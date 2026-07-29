# Explore: explore_2047
# Auto-generated LookML Explore File

include: "/views/domain_42/view_06142.view.lkml"
include: "/views/domain_44/view_06144.view.lkml"
include: "/views/domain_45/view_06145.view.lkml"
include: "/views/domain_46/view_06146.view.lkml"

explore: explore_2047 {
  label: "Explore Explore 2047"
  description: "Comprehensive analytics explore joining base view_06142 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06142
  
  always_filter: {
    filters: [view_06142.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06142.created_at_date: "7 days"]
    unless: [view_06142.id, view_06142.status]
  }

  join: view_06144 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06142.user_id} = ${view_06144.id} ;;
    required_joins: []
  }

  join: view_06145 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06142.account_id} = ${view_06145.account_id} ;;
    required_joins: [view_06144]
  }

  join: view_06146 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06142.category} = ${view_06146.category} ;;
  }

  access_filter: {
    field: view_06142.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06142.is_deleted} = false ;;
}
