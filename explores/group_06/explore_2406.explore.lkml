# Explore: explore_2406
# Auto-generated LookML Explore File

include: "/views/domain_19/view_07219.view.lkml"
include: "/views/domain_21/view_07221.view.lkml"
include: "/views/domain_22/view_07222.view.lkml"
include: "/views/domain_23/view_07223.view.lkml"

explore: explore_2406 {
  label: "Explore Explore 2406"
  description: "Comprehensive analytics explore joining base view_07219 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07219
  
  always_filter: {
    filters: [view_07219.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07219.created_at_date: "7 days"]
    unless: [view_07219.id, view_07219.status]
  }

  join: view_07221 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07219.user_id} = ${view_07221.id} ;;
    required_joins: []
  }

  join: view_07222 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07219.account_id} = ${view_07222.account_id} ;;
    required_joins: [view_07221]
  }

  join: view_07223 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07219.category} = ${view_07223.category} ;;
  }

  access_filter: {
    field: view_07219.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07219.is_deleted} = false ;;
}
