# Explore: explore_3512
# Auto-generated LookML Explore File

include: "/views/domain_37/view_10537.view.lkml"
include: "/views/domain_39/view_10539.view.lkml"
include: "/views/domain_40/view_10540.view.lkml"
include: "/views/domain_41/view_10541.view.lkml"

explore: explore_3512 {
  label: "Explore Explore 3512"
  description: "Comprehensive analytics explore joining base view_10537 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10537
  
  always_filter: {
    filters: [view_10537.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10537.created_at_date: "7 days"]
    unless: [view_10537.id, view_10537.status]
  }

  join: view_10539 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10537.user_id} = ${view_10539.id} ;;
    required_joins: []
  }

  join: view_10540 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10537.account_id} = ${view_10540.account_id} ;;
    required_joins: [view_10539]
  }

  join: view_10541 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10537.category} = ${view_10541.category} ;;
  }

  access_filter: {
    field: view_10537.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10537.is_deleted} = false ;;
}
