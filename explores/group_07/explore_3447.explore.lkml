# Explore: explore_3447
# Auto-generated LookML Explore File

include: "/views/domain_42/view_10342.view.lkml"
include: "/views/domain_44/view_10344.view.lkml"
include: "/views/domain_45/view_10345.view.lkml"
include: "/views/domain_46/view_10346.view.lkml"

explore: explore_3447 {
  label: "Explore Explore 3447"
  description: "Comprehensive analytics explore joining base view_10342 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10342
  
  always_filter: {
    filters: [view_10342.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10342.created_at_date: "7 days"]
    unless: [view_10342.id, view_10342.status]
  }

  join: view_10344 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10342.user_id} = ${view_10344.id} ;;
    required_joins: []
  }

  join: view_10345 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10342.account_id} = ${view_10345.account_id} ;;
    required_joins: [view_10344]
  }

  join: view_10346 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10342.category} = ${view_10346.category} ;;
  }

  access_filter: {
    field: view_10342.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10342.is_deleted} = false ;;
}
