# Explore: explore_2332
# Auto-generated LookML Explore File

include: "/views/domain_47/view_06997.view.lkml"
include: "/views/domain_49/view_06999.view.lkml"
include: "/views/domain_50/view_07000.view.lkml"
include: "/views/domain_01/view_07001.view.lkml"

explore: explore_2332 {
  label: "Explore Explore 2332"
  description: "Comprehensive analytics explore joining base view_06997 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06997
  
  always_filter: {
    filters: [view_06997.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06997.created_at_date: "7 days"]
    unless: [view_06997.id, view_06997.status]
  }

  join: view_06999 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06997.user_id} = ${view_06999.id} ;;
    required_joins: []
  }

  join: view_07000 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06997.account_id} = ${view_07000.account_id} ;;
    required_joins: [view_06999]
  }

  join: view_07001 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06997.category} = ${view_07001.category} ;;
  }

  access_filter: {
    field: view_06997.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06997.is_deleted} = false ;;
}
