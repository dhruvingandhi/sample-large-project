# Explore: explore_1994
# Auto-generated LookML Explore File

include: "/views/domain_33/view_05983.view.lkml"
include: "/views/domain_35/view_05985.view.lkml"
include: "/views/domain_36/view_05986.view.lkml"
include: "/views/domain_37/view_05987.view.lkml"

explore: explore_1994 {
  label: "Explore Explore 1994"
  description: "Comprehensive analytics explore joining base view_05983 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05983
  
  always_filter: {
    filters: [view_05983.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05983.created_at_date: "7 days"]
    unless: [view_05983.id, view_05983.status]
  }

  join: view_05985 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05983.user_id} = ${view_05985.id} ;;
    required_joins: []
  }

  join: view_05986 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05983.account_id} = ${view_05986.account_id} ;;
    required_joins: [view_05985]
  }

  join: view_05987 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05983.category} = ${view_05987.category} ;;
  }

  access_filter: {
    field: view_05983.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05983.is_deleted} = false ;;
}
