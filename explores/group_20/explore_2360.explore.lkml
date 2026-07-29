# Explore: explore_2360
# Auto-generated LookML Explore File

include: "/views/domain_31/view_07081.view.lkml"
include: "/views/domain_33/view_07083.view.lkml"
include: "/views/domain_34/view_07084.view.lkml"
include: "/views/domain_35/view_07085.view.lkml"

explore: explore_2360 {
  label: "Explore Explore 2360"
  description: "Comprehensive analytics explore joining base view_07081 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07081
  
  always_filter: {
    filters: [view_07081.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07081.created_at_date: "7 days"]
    unless: [view_07081.id, view_07081.status]
  }

  join: view_07083 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07081.user_id} = ${view_07083.id} ;;
    required_joins: []
  }

  join: view_07084 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07081.account_id} = ${view_07084.account_id} ;;
    required_joins: [view_07083]
  }

  join: view_07085 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07081.category} = ${view_07085.category} ;;
  }

  access_filter: {
    field: view_07081.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07081.is_deleted} = false ;;
}
