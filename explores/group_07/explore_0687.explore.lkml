# Explore: explore_0687
# Auto-generated LookML Explore File

include: "/views/domain_12/view_02062.view.lkml"
include: "/views/domain_14/view_02064.view.lkml"
include: "/views/domain_15/view_02065.view.lkml"
include: "/views/domain_16/view_02066.view.lkml"

explore: explore_0687 {
  label: "Explore Explore 0687"
  description: "Comprehensive analytics explore joining base view_02062 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02062
  
  always_filter: {
    filters: [view_02062.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02062.created_at_date: "7 days"]
    unless: [view_02062.id, view_02062.status]
  }

  join: view_02064 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02062.user_id} = ${view_02064.id} ;;
    required_joins: []
  }

  join: view_02065 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02062.account_id} = ${view_02065.account_id} ;;
    required_joins: [view_02064]
  }

  join: view_02066 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02062.category} = ${view_02066.category} ;;
  }

  access_filter: {
    field: view_02062.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02062.is_deleted} = false ;;
}
