# Explore: explore_2531
# Auto-generated LookML Explore File

include: "/views/domain_44/view_07594.view.lkml"
include: "/views/domain_46/view_07596.view.lkml"
include: "/views/domain_47/view_07597.view.lkml"
include: "/views/domain_48/view_07598.view.lkml"

explore: explore_2531 {
  label: "Explore Explore 2531"
  description: "Comprehensive analytics explore joining base view_07594 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07594
  
  always_filter: {
    filters: [view_07594.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07594.created_at_date: "7 days"]
    unless: [view_07594.id, view_07594.status]
  }

  join: view_07596 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07594.user_id} = ${view_07596.id} ;;
    required_joins: []
  }

  join: view_07597 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07594.account_id} = ${view_07597.account_id} ;;
    required_joins: [view_07596]
  }

  join: view_07598 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07594.category} = ${view_07598.category} ;;
  }

  access_filter: {
    field: view_07594.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07594.is_deleted} = false ;;
}
