# Explore: explore_1360
# Auto-generated LookML Explore File

include: "/views/domain_31/view_04081.view.lkml"
include: "/views/domain_33/view_04083.view.lkml"
include: "/views/domain_34/view_04084.view.lkml"
include: "/views/domain_35/view_04085.view.lkml"

explore: explore_1360 {
  label: "Explore Explore 1360"
  description: "Comprehensive analytics explore joining base view_04081 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04081
  
  always_filter: {
    filters: [view_04081.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04081.created_at_date: "7 days"]
    unless: [view_04081.id, view_04081.status]
  }

  join: view_04083 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04081.user_id} = ${view_04083.id} ;;
    required_joins: []
  }

  join: view_04084 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04081.account_id} = ${view_04084.account_id} ;;
    required_joins: [view_04083]
  }

  join: view_04085 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04081.category} = ${view_04085.category} ;;
  }

  access_filter: {
    field: view_04081.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04081.is_deleted} = false ;;
}
