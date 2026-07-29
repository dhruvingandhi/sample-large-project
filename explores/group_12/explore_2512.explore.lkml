# Explore: explore_2512
# Auto-generated LookML Explore File

include: "/views/domain_37/view_07537.view.lkml"
include: "/views/domain_39/view_07539.view.lkml"
include: "/views/domain_40/view_07540.view.lkml"
include: "/views/domain_41/view_07541.view.lkml"

explore: explore_2512 {
  label: "Explore Explore 2512"
  description: "Comprehensive analytics explore joining base view_07537 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07537
  
  always_filter: {
    filters: [view_07537.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07537.created_at_date: "7 days"]
    unless: [view_07537.id, view_07537.status]
  }

  join: view_07539 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07537.user_id} = ${view_07539.id} ;;
    required_joins: []
  }

  join: view_07540 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07537.account_id} = ${view_07540.account_id} ;;
    required_joins: [view_07539]
  }

  join: view_07541 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07537.category} = ${view_07541.category} ;;
  }

  access_filter: {
    field: view_07537.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07537.is_deleted} = false ;;
}
