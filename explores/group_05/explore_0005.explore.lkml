# Antigravity modified: branch dg-3
# Explore: explore_0005
# Auto-generated LookML Explore File

include: "/views/domain_16/view_00016.view.lkml"
include: "/views/domain_18/view_00018.view.lkml"
include: "/views/domain_19/view_00019.view.lkml"
include: "/views/domain_20/view_00020.view.lkml"

explore: explore_0005 {
  label: "Explore Explore 0005"
  description: "Comprehensive analytics explore joining base view_00016 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00016
  
  always_filter: {
    filters: [view_00016.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00016.created_at_date: "7 days"]
    unless: [view_00016.id, view_00016.status]
  }

  join: view_00018 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00016.user_id} = ${view_00018.id} ;;
    required_joins: []
  }

  join: view_00019 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00016.account_id} = ${view_00019.account_id} ;;
    required_joins: [view_00018]
  }

  join: view_00020 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00016.category} = ${view_00020.category} ;;
  }

  access_filter: {
    field: view_00016.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00016.is_deleted} = false ;;
}
