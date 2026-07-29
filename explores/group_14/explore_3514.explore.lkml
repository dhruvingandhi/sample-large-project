# Explore: explore_3514
# Auto-generated LookML Explore File

include: "/views/domain_43/view_10543.view.lkml"
include: "/views/domain_45/view_10545.view.lkml"
include: "/views/domain_46/view_10546.view.lkml"
include: "/views/domain_47/view_10547.view.lkml"

explore: explore_3514 {
  label: "Explore Explore 3514"
  description: "Comprehensive analytics explore joining base view_10543 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10543
  
  always_filter: {
    filters: [view_10543.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10543.created_at_date: "7 days"]
    unless: [view_10543.id, view_10543.status]
  }

  join: view_10545 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10543.user_id} = ${view_10545.id} ;;
    required_joins: []
  }

  join: view_10546 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10543.account_id} = ${view_10546.account_id} ;;
    required_joins: [view_10545]
  }

  join: view_10547 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10543.category} = ${view_10547.category} ;;
  }

  access_filter: {
    field: view_10543.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10543.is_deleted} = false ;;
}
