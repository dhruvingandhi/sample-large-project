# Explore: explore_1898
# Auto-generated LookML Explore File

include: "/views/domain_45/view_05695.view.lkml"
include: "/views/domain_47/view_05697.view.lkml"
include: "/views/domain_48/view_05698.view.lkml"
include: "/views/domain_49/view_05699.view.lkml"

explore: explore_1898 {
  label: "Explore Explore 1898"
  description: "Comprehensive analytics explore joining base view_05695 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05695
  
  always_filter: {
    filters: [view_05695.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05695.created_at_date: "7 days"]
    unless: [view_05695.id, view_05695.status]
  }

  join: view_05697 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05695.user_id} = ${view_05697.id} ;;
    required_joins: []
  }

  join: view_05698 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05695.account_id} = ${view_05698.account_id} ;;
    required_joins: [view_05697]
  }

  join: view_05699 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05695.category} = ${view_05699.category} ;;
  }

  access_filter: {
    field: view_05695.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05695.is_deleted} = false ;;
}
