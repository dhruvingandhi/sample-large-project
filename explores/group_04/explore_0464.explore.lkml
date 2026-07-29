# Explore: explore_0464
# Auto-generated LookML Explore File

include: "/views/domain_43/view_01393.view.lkml"
include: "/views/domain_45/view_01395.view.lkml"
include: "/views/domain_46/view_01396.view.lkml"
include: "/views/domain_47/view_01397.view.lkml"

explore: explore_0464 {
  label: "Explore Explore 0464"
  description: "Comprehensive analytics explore joining base view_01393 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01393
  
  always_filter: {
    filters: [view_01393.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01393.created_at_date: "7 days"]
    unless: [view_01393.id, view_01393.status]
  }

  join: view_01395 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01393.user_id} = ${view_01395.id} ;;
    required_joins: []
  }

  join: view_01396 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01393.account_id} = ${view_01396.account_id} ;;
    required_joins: [view_01395]
  }

  join: view_01397 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01393.category} = ${view_01397.category} ;;
  }

  access_filter: {
    field: view_01393.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01393.is_deleted} = false ;;
}
