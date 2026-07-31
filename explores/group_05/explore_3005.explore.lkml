# Update for 500 file diff target
# Explore: explore_3005
# Auto-generated LookML Explore File

include: "/views/domain_16/view_09016.view.lkml"
include: "/views/domain_18/view_09018.view.lkml"
include: "/views/domain_19/view_09019.view.lkml"
include: "/views/domain_20/view_09020.view.lkml"

explore: explore_3005 {
  label: "Explore Explore 3005"
  description: "Comprehensive analytics explore joining base view_09016 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09016
  
  always_filter: {
    filters: [view_09016.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09016.created_at_date: "7 days"]
    unless: [view_09016.id, view_09016.status]
  }

  join: view_09018 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09016.user_id} = ${view_09018.id} ;;
    required_joins: []
  }

  join: view_09019 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09016.account_id} = ${view_09019.account_id} ;;
    required_joins: [view_09018]
  }

  join: view_09020 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09016.category} = ${view_09020.category} ;;
  }

  access_filter: {
    field: view_09016.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09016.is_deleted} = false ;;
}
